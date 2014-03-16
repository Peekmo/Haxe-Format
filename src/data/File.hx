package data;

import haxe.ds.StringMap;
import tools.StringMapTools;
import tools.FormatterTools;
using tools.ArrayTools;

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
     * @var imports : StringMap<String> All file's necessaries imports
     **/
    private var imports : StringMap<String>;

    /**
     * @var usings : Array<String> All usings
     */
    private var usings : Array<String>;

    private var nuAttributes : Array<Attribute>;

    /**
     * Constructor
     * 
     * @param  content : String        File's content
     */
    public function new(content : String) : Void
    {
        this.content = content;
        this.usings  = new Array<String>();
        this.imports = new StringMap<String>();
    }

    /**
     * Process the file formatting < Here happens the magic
     * @return Content formated
     */
    public function format() : String
    {
        var splitted = this.content.split(';');
 
        // Get packages
        this.findPackage(splitted);

        // Get imports
        this.findImports(splitted);

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

        // Usings
        for (use in this.usings) {
            data += 'using ' + use + ';' + FormatterTools.newLine(1);
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
        if (!StringMapTools.inStringMap(name, this.imports)) {
            var className : String = StringTools.trim(name.split('.').pop());
            var spaceSplit : Array<String> = name.split(' ');

            // If spaces, that's probably an alias
            if (spaceSplit.length > 1) {
                className = spaceSplit[spaceSplit.length - 1];
            }

            if (this.imports.exists(className)) {
                return false;
            }

            this.imports.set(className, name);
        }

        return true;
    }

    /**
     * Find file's package
     *
     * @param splitted : Array<String> ';' Splitted values
     */
    private function findPackage(splitted : Array<String>) : Void
    {
        var firstLine : String = StringTools.trim(splitted[0]);

        if (StringTools.startsWith(firstLine, 'package')) {
            this.packages = StringTools.trim(firstLine.substr('package'.length));
            splitted.shift();
        }
    }

    /**
     * Find file's imports
     *
     * @param splitted : Array<String> ';' Splitted values
     */
    private function findImports(splitted : Array<String>) : Void
    {
        var i : Int = 0;
        for (line in splitted.iterator()) {
            line = StringTools.trim(line);

            if (StringTools.startsWith(line, 'import')) {
                this.addImport(StringTools.trim(line.substr('import'.length)));
            }
            else if (StringTools.startsWith(line, 'using')) {
                this.usings.push(StringTools.trim(line.substr('using'.length)));
            }
            else {
                break;
            }

            i += 1;
        }

        for (x in 0...(i)) {
            splitted.shift();
        }
    }
}