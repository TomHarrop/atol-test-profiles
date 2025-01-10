
def mydir = file('s3://pawsey1132.atol.testassembly')


process createFile {

    container 'amazon/aws-cli:2.22.31'
    time '1m'
    cpus 1
    memory '1 GB'

    output:
        path 'testfile.nextflow.txt'

    publishDir mydir

    script:
    """
    echo 'Written by nextflow' > testfile.nextflow.txt
    uname -n >> testfile.nextflow.txt
    date >> testfile.nextflow.txt
    """
}

workflow {
    createFile()
}
