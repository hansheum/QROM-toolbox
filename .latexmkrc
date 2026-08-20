# Let kpathsea see the fonts shipped in the cryptocodeh submodule (\monofont,
# used by \bits).  The trailing comma is required by TEXMFAUXTREES.
# Without it the build fails on a missing JetBrainsMono-Regular-tlf-t1 font.
$ENV{'TEXMFAUXTREES'} = './cryptocodeh/texmf,';
