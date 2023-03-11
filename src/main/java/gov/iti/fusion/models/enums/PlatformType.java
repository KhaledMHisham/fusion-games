package gov.iti.fusion.models.enums;
public enum PlatformType {

    WINDOWS("Windows"),
    LINUX("Linux"),
    MACOS("Mac OS"),
    XBOX("XBOX");

    private final String platform; 

    PlatformType(String platform){
        this.platform = platform;
    }

    public String getPlatformType(){
        return platform;
    }

    
}
