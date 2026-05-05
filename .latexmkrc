# Latexmk configuration file; customize as needed.
# See latexmk manual for more details.

# Use PDF output with LuaLaTeX by default
$pdf_mode = 4;

# Always run LuaLaTeX with --shell-escape option
$lualatex = "lualatex --shell-escape %O %S";

# Use biber for bibliography management
$bibtex_use = 2;

# Main LaTeX file
@default_files = ("thesis.tex");

# Additional file extensions to clean up with 'latexmk -c'
$clean_ext .= " acn acr alg glo gls glg syg syi slg ist lol";

# Custom dependencies; used for various "Lists of ..."
#            from ext    to ext    must?    function
add_cus_dep( 'acn',      'acr',    0,       'makeglossaries'   );
add_cus_dep( 'glo',      'gls',    0,       'makeglossaries'   );
add_cus_dep( 'syg',      'syi',    0,       'makeglossaries'   );
add_cus_dep( 'nlo',      'nls',    0,       'makenomenclature' );

sub makeglossaries {
     system("makeglossaries \"$_[0]\"");
}

sub makenomenclature {
     system("makeindex \"$_[0]\" -s nomencl.ist -o \"$_[1]\"");
}
