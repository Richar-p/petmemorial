
export var deBouncer     = function() {
    clearTimeout(tid);
    tid = setTimeout(function() {
        resizeReset();
    }, delay);
};
export var checkDistance = function(x1, y1, x2, y2) {
    return Math.sqrt(Math.pow(x2 - x1, 2) + Math.pow(y2 - y1, 2));
};
export var linkPoints    = function(point1, hubs) {
    for (let i = 0; i < hubs.length; i++) {
        let distance = checkDistance(point1.x, point1.y, hubs[i].x, hubs[i].y);
        let opacity = 1 - distance / opts.linkRadius;
        if (opacity > 0) {
            drawArea.lineWidth = 0.5;
            drawArea.strokeStyle = `rgba(${rgb[0]}, ${rgb[1]}, ${rgb[2]}, ${opacity})`;
            drawArea.beginPath();
            drawArea.moveTo(point1.x, point1.y);
            drawArea.lineTo(hubs[i].x, hubs[i].y);
            drawArea.closePath();
            drawArea.stroke();
        }
    }
}
export var loop          = function() {
    window.requestAnimationFrame(Packs.application.loop);
    drawArea.clearRect(0,0,w,h);
    for (let i = 0; i < particles.length; i++){
        particles[i].update();
        particles[i].draw();
    }
    for (let i = 0; i < particles.length; i++){
        linkPoints(particles[i], particles);
    }
}
export var tooltipMargin = function(dimension, position) {
    if(dimension == "y") {
        return position <= 50 ? position + 20 : position - 40
    } else if (dimension == "x") {
        return position >= window.innerWidth - 220 ? position - 200 : position
    }
}