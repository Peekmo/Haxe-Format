package data;

import data.CommonDeclarations;

/**
 * Defines attribute's accessors
 */
typedef Accessor = {
    var get : String;
    var set : String;
}

/**
 * Contains attributes's metadata
 *
 * @author Axel Anceau (Peekmo)
 */
class Attribute extends CommonDeclarations
{
    /**
     * @var defaultAccessors : Accessor Default accessors for a public attribute
     */
    public static inline var defaultAccessors = {
        get: 'default',
        set: 'default'
    } 

    /**
     * @var name : String Attribute's name
     */
    public var name(default, null) : String;

    /**
     * @var visibility : String Attribute's visibility (private, public)
     */
    public var visibility(default, null) : String;

    /**
     * @var value : String Default attribute's value
     */
    public var value(default, null) : String;

    /**
     * @var type : String Attribute's type (String, Int, etc..)
     */
    public var type(default, null) : String;

    /**
     * @var accessors : Accessor Accessors (if public attribute)
     */
    public var accessors(default, null) : Accessor;

    /**
     * Constructor - Builds attribute's metadata
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
     * @param  data : String Data to parse
     */
    private function process(data : String) : Void
    {

    }
}