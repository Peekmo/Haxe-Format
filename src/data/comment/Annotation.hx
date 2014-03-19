package data.comment;

/**
 * Annotation's data structure
 *
 * @author Axel Anceau (Peekmo)
 */
typedef Annotation
{
    /**
     * @var type Annotation type (param, author, etc..)
     */
    var type : String;

    /**
     * @var value Annotation's value
     */
    var value : String;

    /**
     * @var identifier Identifier for params for example, name of the variable
     */
    @:optional var identifier : String;
}