while (<>)
{
    s/!\[(写真[^\]]*)\.jpg\][ ]*\([^)]*\)/"![](images\/".&urlencode($1).".jpg)"/eg;
#    s/__([^_]*)__/"![](images\/".&urlencode($1).".jpg)"/eg;
#    s/__([^_]*)__/"![](images\/".$1.".jpg)"/eg;
#    s/__([^_]*)__/"![](images\/.jpg)"/eg;
#    s/__([^_]*)__/![](images\/.jpg)/g;
#    s/__([^_]*)__//g;
    print;
}

sub urlencode()
{
    local($str) = @_;
    $str =~ s/([^0-9A-Za-z])/"%".uc(unpack("H2",$1))/eg;
    return $str;
}