package gov.iti.fusion.utils;

import javax.crypto.SecretKeyFactory;
import javax.crypto.spec.PBEKeySpec;
import java.security.NoSuchAlgorithmException;
import java.security.spec.InvalidKeySpecException;
import java.security.spec.KeySpec;
import java.util.Base64;

public class HashUtils {

    public static String getHashedValue(String data, String salt) {
        byte[] hashedValue = null;
        KeySpec spec = new PBEKeySpec(data.toCharArray(), salt.getBytes(), 10000, 256);
        SecretKeyFactory factory = null;
        try {
            factory = SecretKeyFactory.getInstance("PBKDF2WithHmacSHA512");
            hashedValue = factory.generateSecret(spec).getEncoded();
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException(e);
        } catch (InvalidKeySpecException e) {
            throw new RuntimeException(e);
        }
        return Base64.getEncoder().encodeToString(hashedValue);
    }
}
