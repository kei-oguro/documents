#! /bin/perl

# 色々上手く行かない。
# git bash のコンソールウィンドウにエクスプローラで選択して放り込むのが、現時点では確実に動く。


if ( @ARGV )
{
    foreach (@ARGV)
    {
        &do($_);
    }
}
else
{
#    open(my $fh, "fromclip | iconv -f sjis -t utf-8 |");
    open(my $fh, "fromclip |");
    while (<$fh>)
    {
        &do($_);
    }
    close($fh);
}

sub do()
{
    local($image) = &imagename($_[0]);
    $image =~ /(.*)\.([^.]+)$/;
    local($body, $url, $ext) = ($1, &urlencode($1), $2);
#    print "![$body.$ext](images/" . &urlencode($body) . ".$ext)";
    if ( $ext =~ /^mp4$/i )
    {
        print "<a href='images/$url.$ext'><video src='images/$url.$ext' alt='$body.$ext' >$body.$ext</video></a>\n";
    }
    else {
        print "<img src='images/$url.$ext' alt='$body.$ext' width='30%'>\n";
    }
}

sub imagename()
{
    local ($str) = @_;
    $str =~ s/[\r\n]+$//;
    $str =~ s#¥#/#g;      # convert path separator
    if ( -f $str )
    {
        $str =~ /^(.*\/)?([^\/]+)$/;
        local( $path, $filename ) = ($1, $2);
        if ( ! -e "./images/$filename" )
        {
print "cp\n";
#            system("cp '$path$filename' './images/$filename'");
        }
        return $filename;
    }
    if ( $str =~ /\.(jpg|jpeg|png)/ )
    {
        return $str;
    }
    return $str.'.jpg';

}

sub urlencode
{
    local ($str) = @_;
    $str =~ s/([^0-9A-Za-z])/"%".uc(unpack("H2",$1))/eg;
    return $str;
}

