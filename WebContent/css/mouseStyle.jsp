<%@page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
	html {
	    --color-texta: #1d1d1d;
	    --color-textb: #fff;
	    --color-textc: red;
	}
	
	body, button, input, textarea, a, select, main {
	    cursor: none !important;
	}
	
	.cursor {
	    width: 3rem;
	    height: 3rem;
	    border: 2px solid var(--color-texta);
	    border-radius: 50%;
	    position: absolute;
	    z-index: 1051;
	    transform: translate(-50%, -50%);
	    pointer-events: none;
	    transition: all 0.3s ease;
	    transition-property: background, transform;
	    transform-origin: 100% 100%;
	    backdrop-filter: sepia(20%);
	    background-size: cover;
	    background-color: transparent;
	}
	
	.swal2-container {
		z-index: 1050;
	}
	
    .navbar {
        z-index: 2;
        position: sticky;
        top: 0;
    }

    .menu {
        z-index: 2; /* 'menu' 클래스가 적용된 요소도 포함 */
		width: 80%; 
		padding: 10px;
		height: 60px; 
    }

	.nav-link {
	  font-weight: bold;
	  color: white;
	  font-size: 28px;
	  line-height: 60px;
	}

	.navbar-nav {
	  display: flex;
	  justify-content: space-between;
	  align-items: center; 
	  width: 100%; 
	}

	.navbar-nav .nav-item {
	  text-align: center;
	  margin: 0 30px; 
	}
	
	.navbar-nav .nav-item .nav-link {
	  padding: 20px;
	}
	
	#menuCollapse a {
	  color: white;
	 
	}
	
	.dropdown-menu {
	  right: 0; 
	  left: auto; 
	}
</style>