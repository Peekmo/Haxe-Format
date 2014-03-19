package data.comment;

import data.comment.Comment;
import data.comment.TypeCommentEnum;

/**
 * Parse a comment
 *
 * @author Axel Anceau (Peekmo)
 */
class CommentParser 
{
    /**
     * @var comment Current comment
     */
    public static var comment : Comment; 

    /**
     * Checks if the given letters are a comment or not
     * @param  letters 2 letters to check
     * @return if the letters are a comment's part or not
     */
    public static function isComment(letters : String) : Bool
    {
        if (null == comment) {
            if (letters == '/*') {
                comment = new Comment(TypeCommentEnum.MULTILINE);
            }
            else if (letters == '//') {
                comment = new Comment(TypeCommentEnum.SIMPLE);
            }
            else {
                return false;
            }

            return true;
        }

        comment.add(letters.charAt(0));

        if (('\n' == letters.charAt(1) && comment.type == TypeCommentEnum.SIMPLE)
            || ('*/' == letters && comment.type == TypeCommentEnum.MULTILINE)) {

            return false;
        }

        return true;
    }

    /**
     * Return the comment and clear its value
     * @return The current comment
     */
    public static function popComment() : Comment
    {
        var currentComment : Comment = comment;
        comment = null;

        return currentComment;
    }
}