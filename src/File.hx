import tools.ArrayTools;

/**
 * File's informations
 * 
 * @author Axel Anceau (Peekmo)
 **/
 class File
 {
    /**
     * @var content : String Initial file's content
     **/
    private var content : String;

    /**
     * @var imports : Array<String> All file's necessaries imports
     **/
    private var imports : Array<String>;

    /**
     * Constructor
     * 
     * @param  content : String        File's content
     */
    public function new(content : String) : Void
    {
        this.content = content;
        this.imports = new Array<String>();
    }

    /**
     * Process the file formatting < Here happens the magic
     * @return Content formated
     */
    public function format() : String
    {
        var splitted : Array<String> = this.content.split(';');

        for (line in splitted.iterator()) {
            this.addImport(line);
        }

        return this.imports.join('\n');
    }

    /**
     * Adds an import to the import list
     * @param name: String Import to add
     * @return Success of the operation
     */
    private function addImport(name : String) : Bool
    {
        if (!ArrayTools.inArray(name, this.imports)) {
            var className : String = name.split('.').pop();
            for (v in this.imports.iterator()) {
                if (v.split('.').pop() == className) {
                    return false;
                }
            }
            
            this.imports.push(name);
        }

        return true;
    }
 }