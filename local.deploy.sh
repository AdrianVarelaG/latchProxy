VERSION=local.0.0.1
IMAGEN=kster/latchproxy
NAME=latchproxy

docker service rm $NAME  || true
docker rmi $IMAGEN:$VERSION || true
docker build -t $IMAGEN:$VERSION -f local.Dockerfile .

docker service create \
        --name $NAME \
        --network revnet \
        --restart-condition any \
        --replicas=1  \
        --restart-delay 5s \
        --update-delay 10s \
        --update-parallelism 1 \
        -p 80:80  \
        $IMAGEN:$VERSION
