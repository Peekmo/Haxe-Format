package tools;

/**
 * Usefull functions to easier format data
 *
 * @author Axel Anceau (Peekmo)
 **/
 class FormatterTools
 {
    /**
     * Returns the specific number of new lines
     * @param  number : Int New lines number
     * @return New lines
     */
    public static inline function newLine(number : Int) : String
    {
        var str : String = '';
        for (i in new IntIterator(0, number)) {
            str += '\n';
        }

        return str;
    }
 }