package tools;

/**
 * Tools to manipulate array's data
 *
 * @author Axel Anceau (Peekmo)
 **/
 class ArrayTools
 {
    /**
     * Checks if the value is in the given array
     * 
     * @param  value : T        Value searched
     * @param  array : Array<T> Array to search into
     * @return Value existing or not
     */
    @:generic public static function inArray<T>(value : T, array : Array<T>) : Bool
    {
        for (i in array.iterator()) {
            if (value == i) {
                return true;
            }
        }

        return false;
    }
 }