
/**
 * Application's main
 * 
 * @author Axel Anceau (Peekmo)
 **/
 class Main
 {
    /**
     * Main function
     **/
    public static function main() : Void
    {
        var file : File = new data.File(sys.io.File.getContent('Test.hx'));
        trace('\n' + file.format());
    }
 }