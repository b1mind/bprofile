/** @type {import('@sveltejs/kit').Config} */
import adapter from '@sveltejs/adapter-static';
const config = {
	kit: {
		// hydrate the <div id="svelte"> element in src/app.html
		target: '#svelte',
		//defaults for adapter just so I learn them
		adapter: adapter({ pages: 'build', assets: 'build', fallback: null })
	}
};

export default config;
