package gov.iti.fusion.auth;

import java.io.File;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.security.PrivateKey;
import java.security.PublicKey;
import java.security.Security;
import java.security.interfaces.RSAPrivateKey;
import java.security.interfaces.RSAPublicKey;
import java.util.Date;

import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import org.bouncycastle.asn1.pkcs.PrivateKeyInfo;
import org.bouncycastle.asn1.x509.SubjectPublicKeyInfo;
import org.bouncycastle.jce.provider.BouncyCastleProvider;
import org.bouncycastle.openssl.PEMKeyPair;
import org.bouncycastle.openssl.PEMParser;
import org.bouncycastle.openssl.jcajce.JcaPEMKeyConverter;
import org.bouncycastle.util.io.pem.PemObject;
import org.bouncycastle.util.io.pem.PemWriter;
import org.jose4j.jwa.AlgorithmConstraints.ConstraintType;
import org.jose4j.jwk.RsaJsonWebKey;
import org.jose4j.jwk.RsaJwkGenerator;
import org.jose4j.jws.AlgorithmIdentifiers;
import org.jose4j.jws.JsonWebSignature;
import org.jose4j.jwt.JwtClaims;
import org.jose4j.jwt.consumer.InvalidJwtException;
import org.jose4j.jwt.consumer.JwtConsumer;
import org.jose4j.jwt.consumer.JwtConsumerBuilder;
import org.jose4j.lang.JoseException;

public enum JWTManagerSingleton {

    INSTANCE;
    private RsaJsonWebKey rsaJsonWebKey;

    public RsaJsonWebKey getRsaJsonWebKey(){
        return rsaJsonWebKey;
    }

    JWTManagerSingleton(){
            try {
                rsaJsonWebKey = generateRSAJsonWebKey();
            } catch (JoseException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            } catch (IOException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
    }

    public void init(){}
    public JsonWebSignature getNewSignedToken(){
        JsonWebSignature jws = new JsonWebSignature();

        jws.setKey(rsaJsonWebKey.getPrivateKey());
        jws.setKeyIdHeaderValue(rsaJsonWebKey.getKeyId());
        jws.setAlgorithmHeaderValue(AlgorithmIdentifiers.RSA_PSS_USING_SHA512);

        return jws;
    }

    public JwtClaims validateToken(String token, String audience) throws InvalidJwtException, UnknownHostException{
        JwtConsumer jwtConsumer = new JwtConsumerBuilder()
        .setRequireExpirationTime()
        .setAllowedClockSkewInSeconds(30)
        .setRequireSubject() 
        .setExpectedIssuer("http://"+ InetAddress.getLocalHost().getHostAddress() + ":8888/fusion/api")
        .setExpectedAudience(audience)
        .setEnableRequireIntegrity()
        .setVerificationKey(rsaJsonWebKey.getKey()) 
        .setJwsAlgorithmConstraints( 
                ConstraintType.PERMIT, AlgorithmIdentifiers.RSA_PSS_USING_SHA512) 
        .build();
        return jwtConsumer.processToClaims(token);
    }

    private RsaJsonWebKey generateRSAJsonWebKey() throws JoseException, IOException{
        RsaJsonWebKey rsaJsonWebKey = RsaJwkGenerator.generateJwk(2048);
        rsaJsonWebKey.setKeyId("RSAJSONWEBKEY");
        createPrivateKeyFile(rsaJsonWebKey);
        createPublicKeyFile(rsaJsonWebKey);
        return rsaJsonWebKey;
    }

    private RsaJsonWebKey loadRsaJsonWebKey(){
        Security.addProvider(new BouncyCastleProvider());
        RSAPublicKey publicKey = (RSAPublicKey) getPublicKey();
        RSAPrivateKey privateKey = (RSAPrivateKey) getPrivateKey();
        RsaJsonWebKey rsaJsonWebKey = new RsaJsonWebKey(publicKey);
        rsaJsonWebKey.setPrivateKey(privateKey);
        rsaJsonWebKey.setKeyId("RSAJSONWEBKEY");
        return rsaJsonWebKey;
    }

    private PrivateKey getPrivateKey(){
        try (PEMParser pemParser = new PEMParser(new FileReader("src/main/webapp/keys" + "/privatekey.pem"))) {
            Object object = pemParser.readObject();
            PEMKeyPair pemKeyPair = new PEMKeyPair(null, (PrivateKeyInfo) object);
            JcaPEMKeyConverter converter = new JcaPEMKeyConverter().setProvider("BC");
            PrivateKey privateKey = converter.getPrivateKey(pemKeyPair.getPrivateKeyInfo());
            return privateKey;
        } catch(IOException exception){
            System.out.println(exception.getMessage());
        }
        return null;
    }

    private PublicKey getPublicKey(){
        try (PEMParser pemParser = new PEMParser(new FileReader("src/main/webapp/keys" + "/publickey.pem"))) {
            Object object = pemParser.readObject();
            PEMKeyPair pemKeyPair = new PEMKeyPair((SubjectPublicKeyInfo) object, null);
            JcaPEMKeyConverter converter = new JcaPEMKeyConverter().setProvider("BC");
            PublicKey publicKey = converter.getPublicKey(pemKeyPair.getPublicKeyInfo());
            return publicKey;
        } catch(IOException exception){
            System.out.println(exception.getMessage());
        }
        return null;
    }

    public void createPrivateKeyFile(RsaJsonWebKey rsaJsonWebKey) throws JoseException, IOException{
        File file = new File("src/main/webapp/keys" + "/privatekey.pem");
        file.getParentFile().mkdirs();
        FileWriter fileWriter = new FileWriter(file);
        PemWriter pemWriter = new PemWriter(fileWriter);
        pemWriter.writeObject(new PemObject("PRIVATE KEY", rsaJsonWebKey.getPrivateKey().getEncoded()));
        pemWriter.flush();
        pemWriter.close();
    }

    public void createPublicKeyFile(RsaJsonWebKey rsaJsonWebKey) throws JoseException, IOException{
        File file = new File("src/main/webapp/keys" + "/publickey.pem");
        file.getParentFile().mkdirs();
        FileWriter fileWriter = new FileWriter(file);
        PemWriter pemWriter = new PemWriter(fileWriter);
        pemWriter.writeObject(new PemObject("PUBLIC KEY", rsaJsonWebKey.getPublicKey().getEncoded()));
        pemWriter.flush();
        pemWriter.close();
    }
}
