
def mydir = file('s3://pawsey1132.atol.testassembly')
// def mydir = file('results')


process createFile {

    container 'amazon/aws-cli:2.22.31'
    time '1m'
    cpus 1
    memory '1 GB'

    output:
        path 'testfile.txt'

    publishDir mydir

    script:
    """
    echo 'Written by nextflow' > testfile.txt
    uname -n >> testfile.txt
    date >> testfile.txt
    """
}

workflow {
    createFile()
}
