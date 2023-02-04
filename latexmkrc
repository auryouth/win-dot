$pdf_mode=5;

$xelatex = "xelatex -synctex=1 -interaction=nonstopmode -shell-escape -file-line-error %O %S";
$bibtex = "bibtex %O %S";
$biber = "biber %O %S";

$preview_mode = 1;
$pdf_update_method = 2;

$bibtex_use = 2;

$pdf_previewer = 'start "C:\Users\ausos\AppData\Local\SumatraPDF\SumatraPDF.exe" %O %S';

$clean_ext = "bbl aux blg idx ind lof lot out toc acn acr alg glg glo gls ist fls log fdb_latexmk bcf run.xml xdv";