console.log("hola");

var map = (list, f) => {
    return list.reduce(f);
};

Array.prototype.map_ = function (f){
    return this.reduce(function (acc, current){
        return acc.concat(f(current));
    }, []);
}


Array.prototype.map_2 = f => {
    return this.reduce((acc,current) => {
        return acc.concat(f(current))
    },[]
    )
};


var sumar = (x,y) => {x+y};

var nume = [1,3,4,5,4,5,6,78,8,8,88,88,8,8,8,8,8,8,8,8,8,8,8,8,8,8,888,8,8,8,8,8,8,8,8,8,8]

console.log(nume.map_2(a => a * 10));