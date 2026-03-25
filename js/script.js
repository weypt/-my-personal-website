// 导航栏响应式功能
const menuToggle = document.querySelector('.menu-toggle');
const navLinks = document.querySelector('.nav-links');

menuToggle.addEventListener('click', () => {
    navLinks.classList.toggle('active');
});

// 平滑滚动
const smoothScroll = (target) => {
    const element = document.querySelector(target);
    if (element) {
        window.scrollTo({
            top: element.offsetTop - 70,
            behavior: 'smooth'
        });
        // 关闭移动端菜单
        navLinks.classList.remove('active');
    }
};

// 为导航链接添加点击事件
const navItems = document.querySelectorAll('.nav-links a');
navItems.forEach(item => {
    item.addEventListener('click', (e) => {
        e.preventDefault();
        const target = item.getAttribute('href');
        smoothScroll(target);
    });
});

// 滚动时添加导航栏阴影效果
window.addEventListener('scroll', () => {
    const nav = document.querySelector('nav');
    if (window.scrollY > 50) {
        nav.style.boxShadow = '0 2px 10px rgba(0, 0, 0, 0.1)';
    } else {
        nav.style.boxShadow = '0 2px 4px rgba(0, 0, 0, 0.1)';
    }
});

// 页面加载动画
window.addEventListener('load', () => {
    document.body.classList.add('loaded');
});