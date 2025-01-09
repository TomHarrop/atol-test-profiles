def testfile = 's3://pawsey1132.atol.testassembly/testfile.txt'

process createFile {
    container 'amazon/aws-cli:2.22.31'
    time '1m'
    cpus 1
    memory '1 GB'

    output:
        path(testfile)

    script:
    """
    echo 'This file was created by the Nextflow workflow.' > $testfile
    """
}

workflow {
    createFile()
}
