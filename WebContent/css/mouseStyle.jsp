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
	    z-index: 1000;
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
		z-index: 2;
	}

</style>