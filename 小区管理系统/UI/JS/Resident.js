
document.addEventListener('DOMContentLoaded', () => {
    const clickablePhotos = document.querySelectorAll('.clickable-photo');
    const modalImage = document.getElementById('modalImage');

    // 确保 DOM 加载完成后初始化 Modal
    const myModalElement = document.getElementById('myModal');
    const myModal = new bootstrap.Modal(myModalElement);

    clickablePhotos.forEach(photo => {
        photo.addEventListener('click', function (e) {
            modalImage.src = this.src;
            myModal.show();
        });
    });

    // 为 Modal 添加隐藏事件监听器
    myModal.addEventListener('hidden.bs.modal', function (e) {
        modalImage.src = '#'; // 清除图片源地址
    });
});