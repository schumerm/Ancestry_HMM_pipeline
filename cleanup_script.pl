#perl! -w

if(@ARGV<1){
    print "perl cleanup_script.pl reads_list\n"; exit;
}#print usage

my $list=shift(@ARGV); chomp $list;
open IN, $list or die "cannot open reads_list file\n";

my $file1=""; my $file2="";
while(my $line=<IN>){
    chomp $line;

    my @elements=split(/\t/,$line);
    $file1=$elements[0]; chomp $file1;
    $file2=$elements[1]; chomp $file2;

    my $cleanup1="$file1"."*.par1.sam*";
    my $cleanup2="$file1"."*.par2.sam*";
    #print "$cleanup1\n$cleanup2\n";

    system("rm $cleanup1 $cleanup2");

}#for all lines

system("rm HMM.parental.files.list.*");
my $combined="HMM.hybrid.files.list"."$list"."*";
system("rm $combined");

my $mod_list="$list".".*";
system("rm $mod_list");

system("rm map_batch*sh samtools_batch*sh");
