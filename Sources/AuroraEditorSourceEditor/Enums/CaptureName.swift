//
//  CaptureNames.swift
//  AuroraEditorTextView
//
//  Created by Nanashi Li on 29/12/23.
//

/// A collection of possible capture names for `tree-sitter` with their respected raw values.
/// Enumeration representing different capture names or token types in programming.
///
/// Capture names are used to classify and identify various elements within a programming code or script.
/// This enumeration provides a set of predefined capture names commonly used in code syntax highlighting and parsing.
///
/// - Note: Depending on the context and programming language, different capture names may be used.
///  The main types of nodes which are spell checked are:
///  Comments
///  Strings; where it makes sense. Strings that have interpolation or are typically used for non text
///  purposes are not spell checked (e.g. bash).
///
/// - SeeAlso: `HighlightProvider`
///
/// - Tag: CaptureName
public enum CaptureName: String, CaseIterable {
	/// Represents include directives or imports for external libraries/modules.
	case include
	/// Typically used to identify constructor functions or methods for creating objects.
	case constructor
	/// Denotes reserved keywords or language-specific keywords.
	case keyword
	/// Represents boolean values (`true` or `false`).
	case boolean
	/// May indicate loops or repetition constructs.
	case `repeat`
	/// Used for conditional statements (e.g., `if`, `else`, `switch`, etc.).
	case conditional
	/// Used for conditional statements (e.g. `?` / `:`).
	case conditionalTernary = "keyword.conditional.ternary"
	/// Often associated with HTML or XML tags.
	case tag
	/// Identifies comments or annotations in the code.
	case comment
	/// Denotes variable names or identifiers.
	case variable
	/// Represents object properties or attributes.
	case property
	/// Indicates function or method names.
	case function
	/// Represents function names.
	case functionName = "function.name"
	/// Built-in functions
	case functionBuiltin = "function.builtin"
	/// Function calls
	case functionCall = "function.call"
	/// Preprocessor macros
	case functionMacro = "function.macro"
	/// Method definitions
	case functionMethod = "function.method"
	/// Method calls
	case functionMethodCall = "function.method.call"
	/// Often used to identify class methods or object methods.
	case method
	/// Represents numeric values (e.g., integers or floating-point numbers).
	case number
	/// Specifically identifies floating-point numbers.
	case float
	/// Denotes string literals or character sequences.
	case string
	/// String documenting code (e.g. Python docstrings)
	case stringDocumentation = "string.documentation"
	/// Regular expressions
	case stringRegexp = "string.regexp"
	/// Escape sequences
	case stringEscape = "string.escape"
	/// Other special strings (e.g. dates)
	case stringSpecial = "string.special"
	/// Symbols or atoms
	case stringSpecialSymbol = "string.special.symbol"
	/// URIs (e.g. hyperlinks)
	case stringSpecialUrl = "string.special.url"
	/// Filenames
	case stringSpecialPath = "string.special.path"
	/// Used for data types or type names.
	case type
	/// Represents function or method parameters.
	case parameter
	/// An alternate or custom type identifier.
	case typeAlternate = "type.alternate"
	/// Identifies built-in variable names (e.g. `this`)
	case variableBuiltin = "variable.builtin"
	/// Identifies parameters of a function
	case variableParameter = "variable.parameter"
	/// Identifies special parameters (e.g. `_`, `it`)
	case variableParameterBuiltin = "variable.parameter.builtin"
	/// Identifies Object and struct fields
	case variableMember = "variable.member"
	/// Specifically represents the `return` keyword.
	case keywordReturn = "keyword.return"
	/// Specifically represents the `function` keyword (in some languages).
	case keywordFunction = "keyword.function"
	/// Used to identify a variable, function, class, module, or any other user-defined entity.
	case identifier
	/// Represents operators used in expressions.
	case `operator`
	/// Denotes constants or constant values.
	case constant
	/// Built-in constant values
	case constantBuiltin = "constant.builtin"
	/// Constants defined by the preprocessor
	case constantMacro = "constant.macro"
	/// Represents attributes associated with code elements.
	case attribute
	/// Represents builtin annotations (e.g. `@property` in Python)
	case attributeBuiltin = "attribute.builtin"
	/// Denotes embedded content or code within another context.
	case embedded
	/// Syntax/Parser Errors
	case error
	/// Completely disable the highlight.
	case none
	/// Various preprocessor directives & shebangs.
	case preproc
	/// Preprocessor definition directives.
	case define
	/// Keywords related to debugging.
	case debug
	/// Keywords related to exceptions (e.g., `throw` / `catch`).
	case exception
	/// GOTO and other labels (e.g., `label:` in C), including heredoc labels.
	case label
	/// Object and struct fields.
	case field
	/// Modifiers that affect storage in memory or lifetime.
	case storageClass = "storage.class"
	/// Symbols or atoms.
	case symbol
	/// Modules or namespaces.
	case namespace
	/// Built-in modules or namespaces
	case moduleBuiltin = "module.builtin"
	/// For captures that are only used for concealing.
	case conceal
	/// For defining regions to be spellchecked.
	case spell
	/// For defining regions that should NOT be spellchecked.
	case nospell
	/// Used for folding regions in the code.
	case fold
	/// Represents punctuation characters or symbols.
	case punctuation
	/// Delimiters (e.g. `;` / `.` / `,`)
	case punctuationDelimiter = "punctuation.delimiter"
	/// Brackets (e.g. `()` / `{}` / `[]`)
	case punctuationBracket = "punctuation.bracket"
	/// Special symbols (e.g. `{}` in string interpolation)
	case punctuationSpecial = "punctuation.special"
	/// Denotes escape characters or sequences.
	case escape
	/// Identifies regular expressions.
	case regex
	/// Represents annotations or metadata.
	case annotation
	/// Indicates documentation or comments used for documentation purposes.
	case documentation
	/// Represents emphasized text.
	case emphasis
	/// Represents strongly emphasized text.
	case strong
	/// Denotes hyperlinks or URLs.
	case link
	/// Link, reference descriptions
	case linkLabel = "markup.link.label"
	/// URL-style links
	case linkUrl = "markup.link.url"
	/// Represents headings or section titles.
	case heading
	/// Top-level heading
	case heading1 = "markup.heading.1"
	/// Section heading
	case heading2 = "markup.heading.2"
	/// Subsection heading
	case heading3 = "markup.heading.3"
	/// Heading level 4
	case heading4 = "markup.heading.4"
	/// Heading level 5
	case heading5 = "markup.heading.5"
	/// Heading level 6
	case heading6 = "markup.heading.6"
	/// Indicates text in italic style.
	case italic
	/// Indicates text in bold style.
	case bold
	/// Represents underlined text.
	case underline
	/// Represents text with a strikethrough effect.
	case strikethrough
	/// Denotes the title of a document or section.
	case title
	/// Represents literal or verbatim text.
	case literal
	/// Literal or verbatim text as a stand-alone block (use priority 90 for blocks with injections)
	case literalBlock = "markup.raw.block"
	/// Identifies URIs or URLs.
	case uri
	/// Denotes mathematical expressions or equations.
	case math
	/// Represents metadata or meta-information.
	case meta
	/// Indicates inherited properties or elements.
	case inherit
	/// Represents the background color or style.
	case background
	/// Represents plain text without any specific formatting.
	case text
	/// Denotes a reference or citation.
	case reference
	/// Identifies an environment or context.
	case environment
	/// Represents the name of an environment.
	case environmentName = "environment.name"
	/// Indicates a note or additional information.
	case note
	/// Represents a todo item or task.
	case todo
	/// Denotes individual characters.
	case character
	/// Special characters (e.g. wildcards)
	case characterSpecial = "character.special"
	/// Represents escape characters within strings or literals.
	case escapeCharacter = "escape.character"
	/// Indicates delimiters used to separate elements.
	case delimiter
	/// Represents angle brackets (< and >).
	case angle
	/// Represents square brackets ([ and ]).
	case bracket
	/// Denotes CDATA sections in XML or HTML.
	case cdata
	/// Represents DOCTYPE declarations in XML or HTML.
	case doctype
	/// Identifies entities in XML or HTML.
	case entity
	/// Represents class names.
	case className = "class.name"
	/// Represents tag names in XML or HTML.
	case tagName = "tag.name"
	/// XML-style tag attributes
	case tagAttribute = "tag.attribute"
	/// XML-style tag delimiters
	case tagDelimiter = "tag.delimiter"
	/// Identifies template tags or placeholders.
	case templateTag = "template.tag"
	/// Represents built-in or predefined types.
	case builtinType = "builtin.type"
	/// Represents primitive data types.
	case primitiveType = "primitive.type"
	/// Builtin tag names (e.g. HTML5 tags)
	case tagBuiltin = "tag.builtin"
	/// Identifiers in type definitions (e.g. `typedef <type> <identifier>` in C)
	case typeDefinition = "type.definition"
	/// Keywords related to coroutines (e.g. `go` in Go, `async/await` in Python)
	case keywordCoroutine = "keyword.coroutine"
	/// Operators that are English words (e.g. `and` / `or`)
	case keywordOperator = "keyword.operator"
	/// Keywords for including modules (e.g. `import` / `from` in Python)
	case keywordImport = "keyword.import"
	/// Keywords describing namespaces and composite types (e.g. `struct`, `enum`)
	case keywordType = "keyword.type"
	/// Keywords modifying other constructs (e.g. `const`, `static`, `public`)
	case keywordModifier = "keyword.modifier"
	/// Keywords related to loops (e.g. `for` / `while`)
	case keywordRepeat = "keyword.repeat"
	/// Block quotes
	case markupQuote = "markup.quote"
	/// List markers
	case markupList = "markup.list"
	/// Checked todo-style list markers
	case markupListChecked = "markup.list.checked"
	/// Unchecked todo-style list markers
	case markupListUnchecked = "markup.list.unchecked"
	/// Line comments
	case commentLine = "comment.line"
	/// Block comments
	case commentBlock = "comment.block"
	/// Error-type comments (e.g. `ERROR`, `FIXME`, `DEPRECATED`)
	case commentError = "comment.error"
	/// Warning-type comments (e.g. `WARNING`, `FIX`, `HACK`)
	case commentWarning = "comment.warning"
	/// Note-type comments (e.g. `NOTE`, `INFO`, `XXX`)
	case commentNote = "comment.note"

	/// Returns a specific capture name case from a given string.
	/// - Parameter string: A string to get the capture name from.
	/// - Returns: A `CaptureNames` case.
	static func fromString(_ string: String?) -> CaptureName? {
		CaptureName(rawValue: string ?? "")
	}

	/// Returns an alternate capture name for certain cases.
	var alternate: CaptureName {
		switch self {
		case .type:
			return .typeAlternate
		default:
			return self
		}
	}
}
