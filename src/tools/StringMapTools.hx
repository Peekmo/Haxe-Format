package tools;

import haxe.ds.StringMap;

/**
 * Tools to manipulate StringMap's data
 *
 * @author Axel Anceau (Peekmo)
 **/
 class StringMapTools
 {
    /**
     * Checks if the value is in the given StringMap
     * 
     * @param  value : T            Value searched
     * @param  array : StringMap<T> Array to search into
     * @return Value existing or not
     */
    @:generic public static function inStringMap<T>(value : T, array : StringMap<T>) : Bool
    {
        for (i in array.iterator()) {
            if (value == i) {
                return true;
            }
        }

        return false;
    }
 }