// ==================== DOM加载完成后执行 ====================
document.addEventListener('DOMContentLoaded', function() {
    initializePage();
});

// ==================== 页面初始化 ====================
function initializePage() {
    setupNavigation();
    setupScrollEffects();
    setupMobileMenu();
    setupFormHandling();
    setupIntersectionObserver();
    animateSkillBars();
}

// ==================== 导航栏效果 ====================
function setupNavigation() {
    const header = document.querySelector('.header');
    
    window.addEventListener('scroll', function() {
        if (window.scrollY > 50) {
            header.classList.add('scrolled');
        } else {
            header.classList.remove('scrolled');
        }
    });
    
    // 平滑滚动到锚点
    document.querySelectorAll('a[href^="#"]').forEach(anchor => {
        anchor.addEventListener('click', function(e) {
            e.preventDefault();
            const target = document.querySelector(this.getAttribute('href'));
            if (target) {
                target.scrollIntoView({
                    behavior: 'smooth',
                    block: 'start'
                });
            }
        });
    });
}

// ==================== 滚动效果 ====================
function setupScrollEffects() {
    // 返回顶部按钮
    const backToTopButton = document.createElement('button');
    backToTopButton.innerHTML = '↑';
    backToTopButton.className = 'back-to-top';
    backToTopButton.setAttribute('aria-label', '返回顶部');
    document.body.appendChild(backToTopButton);
    
    window.addEventListener('scroll', function() {
        if (window.scrollY > 300) {
            backToTopButton.classList.add('show');
        } else {
            backToTopButton.classList.remove('show');
        }
    });
    
    backToTopButton.addEventListener('click', function() {
        window.scrollTo({
            top: 0,
            behavior: 'smooth'
        });
    });
}

// ==================== 移动端菜单 ====================
function setupMobileMenu() {
    const mobileToggle = document.querySelector('.mobile-menu-toggle');
    const navMenu = document.querySelector('.nav-menu');
    
    if (mobileToggle && navMenu) {
        mobileToggle.addEventListener('click', function() {
            navMenu.classList.toggle('active');
            mobileToggle.classList.toggle('active');
        });
        
        // 点击菜单项后关闭移动端菜单
        navMenu.querySelectorAll('a').forEach(link => {
            link.addEventListener('click', function() {
                navMenu.classList.remove('active');
                mobileToggle.classList.remove('active');
            });
        });
        
        // 添加移动端菜单样式
        const style = document.createElement('style');
        style.textContent = `
            @media (max-width: 768px) {
                .nav-menu {
                    position: fixed;
                    top: 70px;
                    left: -100%;
                    width: 100%;
                    height: calc(100vh - 70px);
                    background: rgba(255, 255, 255, 0.15);
                    backdrop-filter: blur(12px);
                    flex-direction: column;
                    justify-content: flex-start;
                    align-items: center;
                    padding-top: 2rem;
                    transition: left 0.3s ease;
                    z-index: 999;
                }
                
                .nav-menu.active {
                    left: 0;
                }
                
                .nav-menu li {
                    margin: 1rem 0;
                }
                
                .mobile-menu-toggle.active span:nth-child(1) {
                    transform: rotate(45deg) translate(5px, 5px);
                }
                
                .mobile-menu-toggle.active span:nth-child(2) {
                    opacity: 0;
                }
                
                .mobile-menu-toggle.active span:nth-child(3) {
                    transform: rotate(-45deg) translate(7px, -6px);
                }
            }
        `;
        document.head.appendChild(style);
    }
}

// ==================== 表单处理 ====================
function setupFormHandling() {
    const contactForm = document.getElementById('contactForm');
    
    if (contactForm) {
        contactForm.addEventListener('submit', function(e) {
            e.preventDefault();
            
            // 获取表单数据
            const formData = new FormData(contactForm);
            const name = formData.get('name');
            const email = formData.get('email');
            const message = formData.get('message');
            
            // 简单验证
            if (!name || !email || !message) {
                showMessage('请填写所有必填字段', 'error');
                return;
            }
            
            if (!isValidEmail(email)) {
                showMessage('请输入有效的邮箱地址', 'error');
                return;
            }
            
            // 模拟发送过程
            const submitButton = contactForm.querySelector('button[type="submit"]');
            const originalText = submitButton.textContent;
            submitButton.textContent = '发送中...';
            submitButton.disabled = true;
            
            // 模拟API调用
            setTimeout(() => {
                showMessage('消息发送成功！我会尽快回复您。', 'success');
                contactForm.reset();
                submitButton.textContent = originalText;
                submitButton.disabled = false;
            }, 1500);
        });
    }
}

// ==================== 邮箱验证 ====================
function isValidEmail(email) {
    const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/;
    return emailRegex.test(email);
}

// ==================== 消息提示 ====================
function showMessage(message, type = 'info') {
    // 移除现有的消息
    const existingMessage = document.querySelector('.message-toast');
    if (existingMessage) {
        existingMessage.remove();
    }
    
    // 创建新消息
    const toast = document.createElement('div');
    toast.className = `message-toast ${type}`;
    toast.textContent = message;
    
    // 添加样式
    const style = document.createElement('style');
    style.textContent = `
        .message-toast {
            position: fixed;
            top: 20px;
            right: 20px;
            padding: 1rem 2rem;
            border-radius: 8px;
            color: white;
            font-weight: 500;
            z-index: 10000;
            transform: translateX(100%);
            transition: transform 0.3s ease;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
        }
        
        .message-toast.show {
            transform: translateX(0);
        }
        
        .message-toast.success {
            background: linear-gradient(90deg, #10b981, #059669);
        }
        
        .message-toast.error {
            background: linear-gradient(90deg, #ef4444, #dc2626);
        }
        
        .message-toast.info {
            background: linear-gradient(90deg, #3b82f6, #2563eb);
        }
    `;
    document.head.appendChild(style);
    
    document.body.appendChild(toast);
    
    // 显示动画
    setTimeout(() => {
        toast.classList.add('show');
    }, 100);
    
    // 自动隐藏
    setTimeout(() => {
        toast.classList.remove('show');
        setTimeout(() => {
            toast.remove();
        }, 300);
    }, 3000);
}

// ==================== 交叉观察器 ====================
function setupIntersectionObserver() {
    const observerOptions = {
        threshold: 0.1,
        rootMargin: '0px 0px -50px 0px'
    };
    
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                entry.target.classList.add('animate-in');
            }
        });
    }, observerOptions);
    
    // 观察所有.section元素
    document.querySelectorAll('.section').forEach(section => {
        observer.observe(section);
    });
    
    // 添加动画样式
    const style = document.createElement('style');
    style.textContent = `
        .section {
            opacity: 0;
            transform: translateY(30px);
            transition: opacity 0.6s ease, transform 0.6s ease;
        }
        
        .section.animate-in {
            opacity: 1;
            transform: translateY(0);
        }
    `;
    document.head.appendChild(style);
}

// ==================== 技能条动画 ====================
function animateSkillBars() {
    const skillBars = document.querySelectorAll('.skill-progress');
    
    const observer = new IntersectionObserver((entries) => {
        entries.forEach(entry => {
            if (entry.isIntersecting) {
                const bar = entry.target;
                const width = bar.style.width;
                bar.style.width = '0';
                setTimeout(() => {
                    bar.style.width = width;
                }, 300);
                observer.unobserve(bar);
            }
        });
    });
    
    skillBars.forEach(bar => {
        observer.observe(bar);
    });
}

// ==================== 返回顶部按钮样式 ====================
const backToTopStyle = document.createElement('style');
backToTopStyle.textContent = `
    .back-to-top {
        position: fixed;
        bottom: 30px;
        right: 30px;
        width: 50px;
        height: 50px;
        border-radius: 50%;
        background: linear-gradient(135deg, #6366f1, #8b5cf6);
        color: white;
        border: none;
        font-size: 1.2rem;
        cursor: pointer;
        opacity: 0;
        transform: translateY(20px);
        transition: all 0.3s ease;
        box-shadow: 0 4px 15px rgba(99, 102, 241, 0.4);
        z-index: 1000;
    }
    
    .back-to-top:hover {
        transform: translateY(-2px);
        box-shadow: 0 6px 20px rgba(99, 102, 241, 0.6);
    }
    
    .back-to-top.show {
        opacity: 1;
        transform: translateY(0);
    }
`;
document.head.appendChild(backToTopStyle);

// ==================== 页面加载完成事件 ====================
window.addEventListener('load', function() {
    // 页面完全加载后的处理
    document.body.classList.add('loaded');
    
    // 初始化打字效果（如果需要）
    initTypingEffect();
});

// ==================== 打字效果（可选） ====================
function initTypingEffect() {
    const bioElement = document.querySelector('.bio');
    if (bioElement) {
        const originalText = bioElement.textContent;
        bioElement.textContent = '';
        bioElement.classList.add('typing');
        
        let i = 0;
        const typingInterval = setInterval(() => {
            if (i < originalText.length) {
                bioElement.textContent += originalText.charAt(i);
                i++;
            } else {
                clearInterval(typingInterval);
                bioElement.classList.remove('typing');
            }
        }, 50);
    }
}

// ==================== 性能优化 ====================
// 防抖函数
function debounce(func, wait) {
    let timeout;
    return function executedFunction(...args) {
        const later = () => {
            clearTimeout(timeout);
            func(...args);
        };
        clearTimeout(timeout);
        timeout = setTimeout(later, wait);
    };
}

// 节流函数
function throttle(func, limit) {
    let inThrottle;
    return function() {
        const args = arguments;
        const context = this;
        if (!inThrottle) {
            func.apply(context, args);
            inThrottle = true;
            setTimeout(() => inThrottle = false, limit);
        }
    }
}

// 对滚动事件进行节流优化
const throttledScrollHandler = throttle(function() {
    // 滚动相关的处理逻辑
}, 16); // 约60fps

window.addEventListener('scroll', throttledScrollHandler);