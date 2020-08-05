#! /bin/perl


if ( @ARGV )
{
    foreach (@ARGV)
    {
        &do($_);
    }
}
else
{
    open(my $fh, "fromclip | iconv -f sjis -t utf-8 |");
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
    local($body, $ext) = ($1, $2);
    print "![$body.$ext](images/" . &urlencode($body) . ".$ext)";
}

sub imagename()
{
    local ($str) = @_;
    $str =~ s/[\r\n]+$//;
    $str =~ s#¥#/#g;      # convert path separator
    if ( -f $str )
    {
        $str =~ /^(.*\/)([^\/]+)$/;
        $path = $1;
        $body = $2;
        if ( ! -e "./images/$str" )
        {
print "cp\n";
#            system("cp '$path$body' './images/$body'");
        }
        return $body;
    }
    if ( $str =~ /\.(jpg|jpeg|png)/ )
    {
        return $2;
    }
    return $str.'.jpg';

}

sub urlencode
{
    local ($str) = @_;
    $str =~ s/([^0-9A-Za-z])/"%".uc(unpack("H2",$1))/eg;
    return $str;
}

