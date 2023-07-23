function dotenv(){
    export $(cat $TOOLS_PATH/.env | xargs)
    # echo $TOOLS_PATH/.env 
    # if [ ! -f $TOOLS_PATH/.env ]
    # then
    # cat $TOOLS_PATH/.env
    # echo "fuck"
    
    # fi
}
function put(){
    echo "Putting $1 to $2"
    echo -e "put -r $1" | sftp -i $KEYFILE -oPort=$PORT $USERNAME@$HOST:$2
}
export -f put
export -f dotenv