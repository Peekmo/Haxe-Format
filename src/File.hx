import tools.ArrayTools;
import tools.FormatterTools;

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
     * @var package : String File's package
     */
    private var packages : String;

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
        // Get packages
        this.findPackage();

        var splitted = this.content.split(';');

        for (line in splitted.iterator()) {
            this.addImport(line);
        }

        return this.buildFile();
    }

    /**
     * Builds final file's data
     * @return New file formatted
     **/
    private function buildFile() : String
    {
        var data : String = '';

        // Package
        if (null != this.packages) {
            data += 'package ' + this.packages + ';';
            data += FormatterTools.newLine(2);
        }

        // Imports
        for (imp in this.imports) {
            data += 'import ' + imp + ';' + FormatterTools.newLine(1);
        }

        return data;
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

    /**
     * Find file's package
     */
    private function findPackage() : Void
    {
        var splitted : Array<String> = this.content.split('package');
        
        if (splitted.length > 2) {
            throw "Invalid packages";
        } 
        else if (splitted.length == 2) {
            this.packages = splitted[1].split(';')[0];
        }
    }
}