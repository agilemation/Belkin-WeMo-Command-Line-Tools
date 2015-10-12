#123456789o123456789o123456789o123456789o123456789o123456789o123456789o123456789
# Core Alias definitions                                                       #
#123456789o123456789o123456789o123456789o123456789o123456789o123456789o123456789

shopt -s expand_aliases
alias testArgs='testNe "$#" "0"'
alias testArgsEq='testEq "$#"'
alias testArgsNe='testNe "$#"'
alias testArgsLt='testIntLt "$#"'
alias testArgsLe='testIntLe "$#"'
alias testArgsGt='testIntGt "$#"'
alias testArgsGe='testIntGe "$#"'
alias testArgsNone='testEq "$#" "0"'
alias testArgsMatch='testMatch "$#"'
alias finish='eval $( getValidTerminationCommand ; )'
alias toDevNull='cat - >/dev/null 2>/dev/null'

#123456789o123456789o123456789o123456789o123456789o123456789o123456789o123456789
# Library Functions                                                            #
#123456789o123456789o123456789o123456789o123456789o123456789o123456789o123456789

toStdErr () { cat - 1>&2 ; }
echoError () { printf '%s\n' "Error: $@" | toStdErr ; }

datestamp () { date +"%Y-%m-%d[%H-%M-%S]" ; return 0 ; }
setDatestamp () { export DATESTAMP="$( datestamp )" ; }

testEq () { [ "${1}" = "${2}" ] ; } # True if there is equality
testNe () { [ "${1}" != "${2}" ] ; } # True if there is NOT equality
testMatch () { [[ ${1} =~ ${2} ]] ; } # True if ARG1 MATCHES the Extended RegEx in ARG2
testEmpty () { [ -z "${1}" ] ; } # True if the length of string is zero.
testValue () { [ -n "${1}" ] ; } # True if the length of string is nonzero/not-null/Has a value.

testFileExists () { [ -e "${1}" ] ; } # True if file exists.
testFileDirectory () { [ -d "${1}" ] ; } # True if file is a directory.
testFileTerm () { [ -t "${1}" ] ; } # -t fd True if file descriptor fd is open and refers to a terminal
testFileSymbolicLink () { [ -L "${1}" ] ; } # True if file is a symbolic link

testBool () { case "${1}" in [Tt][Rr][Uu][Ee] | 0 | [Ff][Aa][Ll][Ss][Ee] | 1 ) return 0 ;; *) return 1 ;; esac } # True if any allowed boolean value
testBoolTrue () { case "${1}" in [Tt][Rr][Uu][Ee] | 0 ) return 0 ;; *) return 1 ;; esac } # True if a 'true' boolean value
testBoolFalse () { case "${1}" in [Ff][Aa][Ll][Ss][Ee] | 1 ) return 0 ;; *) return 1 ;; esac } # True if a 'false' boolean value

testInt () { [ "${1}" -eq "${1}" ] 2>/dev/null ; }  # I know this is okay with bash, to test with bourne
testIntEq () { testInt "${1}" && testInt "${2}" && [ "${1}" -eq "${2}" ] ; }
testIntNe () { testInt "${1}" && testInt "${2}" && [ "${1}" -ne "${2}" ] ; }
testIntLt () { testInt "${1}" && testInt "${2}" && [ "${1}" -lt "${2}" ] ; }
testIntLe () { testInt "${1}" && testInt "${2}" && [ "${1}" -le "${2}" ] ; }
testIntGt () { testInt "${1}" && testInt "${2}" && [ "${1}" -gt "${2}" ] ; }
testIntGe () { testInt "${1}" && testInt "${2}" && [ "${1}" -ge "${2}" ] ; }
testDebug () { testBoolTrue "${DEBUGbool}" ; } # True if DEBUGbool (boolean) var is true
testVerbose () { testBoolTrue "${VERBOSEbool}" ; } # True if VERBOSEbool (boolean) var is true

testSourced () { local c="0" ; local m="${#BASH_SOURCE[@]}" ; until testEq "$( basename "${BASH_SOURCE[${c}]}" )" "${SCRIPTfile}" && testMatch "${FUNCNAME[${c}]}" "source|main" && testIntLt "${c}" "${m}" ; do ((c++)) ; done ; if testEq "source" "${FUNCNAME[${c}]}" ; then return 0 ; else return 1 ; fi ; } # True if calling script is sourced into environment

getValidTerminationCommand () { testSourced && printf "%s" "return" || printf "%s" "exit" ; }
getStringAbsoluteLength () { local LENGHT_OF_STRINGint="${1}" ; shift ; printf "%-${LENGHT_OF_STRINGint}.${LENGHT_OF_STRINGint}s" "$*" ; }

getFunctionNames () { if testArgs ; then cat "$@" ; else declare -f ; fi | grep '^[a-z_A-Z0-9]*[a-z_A-Z0-9 ]*()' | awk '{print $1}' | sed 's/()//g' ; }


#123456789o123456789o123456789o123456789o123456789o123456789o123456789o123456789
# Library Functions - Unobfuscated and verbose                                 #
#123456789o123456789o123456789o123456789o123456789o123456789o123456789o123456789

testSourced () 
{
    # True if calling script is sourced into environment
    testEmpty "${SCRIPTfile}" && echo "Error: Need SCRIPTfile set with getScriptFile before using this function" && exit 1
    local COUNTint="0"
    local COUNT_MAXint="${#BASH_SOURCE[@]}"
    # while testNe "${BASH_SOURCE[(COUNTint-1)]}" "$( basename "${SCRIPTfile}" )"
    # First parse BASH_SOURCE until we find the SCRIPTfile, then parse that until
    # we find either source or main so our function can opperate in a relevant context
    # Protected by checking we don't hit the COUNT_MAXint which is the last value
    until testEq "$( basename "${BASH_SOURCE[(COUNTint)]}" )" "${SCRIPTfile}"        &&
        testMatch "${FUNCNAME[${COUNTint}]}" "source|main"                           &&
        testIntLt "${COUNTint}" "${COUNT_MAXint}" 
    do
        # echo -n "Increasing Count by 1, from ${COUNTint}, "
        ((COUNTint++))
        #echo "to ${COUNTint}"
    done
    if testEq "source" "${FUNCNAME[${COUNTint}]}" ;
    then
        return 0 ;
    else
        return 1 ;
    fi ;
} 
