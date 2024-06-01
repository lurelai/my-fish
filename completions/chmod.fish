# AUTOCOMPLETION GUIDE
# -d => a tag to any completion
# 
#

if chmod --version &>/dev/null # gnu's not unix
    # complete chmod -s c -l changes -d 'Like -v but report only changes'
    # complete chmod -l no-preserve-root -d 'Don\'t treat / special (default)'
    # complete chmod -l preserve-root -d 'Fail to operate recursively on /'
    # complete chmod -s f -l silent -l quiet -d 'Suppress most errors'
    # complete chmod -s v -l verbose -d 'Prints each file processed'
    # complete chmod -l reference -d 'Use RFILEs mode instead of MODE values' -r
    # complete chmod -s R -l recursive -d 'Operate recursively'
    # complete chmod -l help -d 'Display help and exit'
    # complete chmod -l version -d 'Display version and exit'

    complete -c chmod -s o -d 'no'
    complete -c chmod -s a -d 'yes'
end
