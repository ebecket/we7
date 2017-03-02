var delta = 0.15
var collection;
function floaters() {
    this.items = [];
    this.addItem = function(id, x, y, w, h, content) {
        document.write('<div id=' + id + ' style="z-index:10; position: absolute; width:' + (typeof (w) == 'string' ? eval(w) : w) + 'px; height:' + (typeof (h) == 'string' ? eval(h) : h) + 'px; left:' + (typeof (x) == 'string' ? eval(x) : x) + 'px;top:' + (typeof (y) == 'string' ? eval(y) : y) + 'px;">' + content + '</div>');

        var newItem = {};
        newItem.object = document.getElementById(id);
        newItem.x = x;
        newItem.y = y;

        this.items[this.items.length] = newItem;
    }

    this.play = function() {
        collection = this.items
        //setInterval('play()', 10);
    }
}

function play() {
    for (var i = 0; i < collection.length; i++) {
        var followObj = collection[i].object;
        var followObj_x = (typeof (collection[i].x) == 'string' ? eval(collection[i].x) : collection[i].x);
        var followObj_y = (typeof (collection[i].y) == 'string' ? eval(collection[i].y) : collection[i].y);

        if (followObj.offsetLeft != (document.documentElement.scrollLeft + followObj_x)) {
            var dx = (document.documentElement.scrollLeft + followObj_x - followObj.offsetLeft) * delta;
            dx = (dx > 0 ? 1 : -1) * Math.ceil(Math.abs(dx));
            followObj.style.left = followObj.offsetLeft + dx + 'px';
        }

        if (followObj.offsetTop != (document.documentElement.scrollTop + followObj_y)) {
            var dy = (document.documentElement.scrollTop + followObj_y - followObj.offsetTop) * delta;
            dy = (dy > 0 ? 1 : -1) * Math.ceil(Math.abs(dy));
            followObj.style.top = followObj.offsetTop + dy + 'px';
        }
        followObj.style.display = '';
    }
}

var theFloaters = new floaters();
theFloaters.addItem('wise10ad', 2, 68, 100, 68, '<a href="http://xmu.xmu.edu.cn/wise10" target="_blank"><img src="/_data/file/WISE10logo.jpg" border="0"></a>');
//theFloaters.addItem('zyss', 2, 220, 120, 100, '<a href="http://se.xmu.edu.cn/pm/" target="_blank"><img src="/_data/1.jpg" border="0"></a>');
//theFloaters.addItem('edp', 2, 340, 120, 100, '<a href="http://www.xdedp.com" target="_blank"><img src="/_data/2.gif" border="0"></a>');



theFloaters.play();