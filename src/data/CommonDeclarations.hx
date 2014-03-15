package data;

/**
 * Contains attributes & functions commons metadata & proccesses
 *
 * @author Axel Anceau (Peekmo)
 */
class CommonDeclarations
{   
    /**
     * @var description : String Attribute's description (from comments)
     */
    public var description(default, null) : String;

    /**
     * @var declaration : String Attribute's visibility (private, public, inline, etc..)
     */
    public var declaration(default, null) : String;

    /**
     * @var metadata : Array<String> Attribute's metadata
     */
    public var metadata(default, null) : Array<String>;

    /**
     * @var annotations : String Any other annotations
     */
    public var annotations(default, null) : Array<String>;

    /**
     * Constructor - Builds metadata
     * 
     * @param  data : String Data to parse
     */
    public function new(data : String) : Void
    {
        this.description = '';
        this.declaration = '';
        this.metadata = new Array<String>();
        this.annotations = new Array<String>();

        this.process(data);
    }

    /**
     * Data building process
     *
     * @param  data :             String Data to parse
     */
    private function process(data : String) : Void
    {
        var status : StatusEnum = StatusEnum.NONE;

        for (i in new IntIterator(0, data.length)) {
            var letter : String = data.charAt(i);

            if (letter == '/') {
                // Starting reading informations
                if (StatusEnum.NONE == status) {
                    status = StatusEnum.COMMENT;
                    continue;
                }

                // X slashes for comment
                else if (StatusEnum.COMMENT == status && data.charAt(i-1) == '/') {
                    continue;
                }

                // End of comments
                else if (StatusEnum.COMMENT == status && data.charAt(i-1) == '*') {
                    status = StatusEnum.NONE;
                    continue;
                }
            }

            if (StatusEnum.DESCRIPTION == status) {
                this.description += letter;
            }

            else if (StatusEnum.METADATA == status) {
                this.metadata[this.metadata.length - 1] += letter;
            }

            else if (StatusEnum.DECLARATION == status) {
                this.declaration += letter;
            }
        }
    }
}