package data;

/**
 * Contains attributes & functions commons metadata & proccesses
 *
 * @author Axel Anceau (Peekmo)
 */
class CommonDeclarations
{   
    /**
     * @var description : String Attribute's description (from comments)
     */
    public var description(default, null) : String;

    /**
     * @var isStatic : Bool Static attribute or not
     */
    public var isStatic(default, null) : Bool;

    /**
     * @var isInline : Bool Inline attribute or not
     */
    public var isInline(default, null) : Bool;

    /**
     * @var metadata : Array<String> Attribute's metadata
     */
    public var metadata(default, null) : Array<String>;

    /**
     * @var annotations : String Any other annotations
     */
    public var annotations(default, null) : Array<String>;

    /**
     * Constructor - Builds metadata
     * 
     * @param  data : String Data to parse
     */
    public function new(data : String) : Void
    {
        this.process(data);
    }

    /**
     * Data building process
     *
     * @param  data :             String Data to parse
     */
    private function process(data : String) : Void
    {

    }
}