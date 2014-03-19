package data.comment;

import data.comment.TypeCommentEnum

/**
 * Contains comment's informations
 *
 * @author Axel Anceau
 */
class Comment
{
    /**
     * @var type Comment's type (Simple or Multiline)
     */
    public var type : TypeCommentEnum;

    /**
     * @var description Global text in the comment
     */
    private var description : String;

    /**
     * @var annotations Annotations in the comment
     */
    private var annotations : Array<Annotation>;

    /**
     * Constructor
     * @param type Comment's type (Simple or Multiline)
     */
    public function new(type : TypeCommentEnum) : Void
    {
        this.type = type;
        this.description = '';
        this.annotations = new Array<Annotation>();
    }

    /**
     * Adds a letter to the comment
     * @param letter Letter to add
     */
    public function add(letter: String) : Void
    {

    }
}