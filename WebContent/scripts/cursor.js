document.addEventListener('mousemove', function (e) {
    var dot = document.getElementById('cursor');
    dot.style.left = e.pageX + 'px';
    dot.style.top = e.pageY + 'px';
})