import cookie from 'cookie';
import { v4 as uuid } from '@lukeed/uuid';
import {
	handleIncomingRedirect,
	login,
	fetch,
	getDefaultSession
} from '@inrupt/solid-client-authn-browser';

export function getSession(reqest) {
	return {
		user: {}
	};
}

export const handle = async ({ request, resolve }) => {
	const cookies = cookie.parse(request.headers.cookie || '');
	request.locals.userid = cookies.userid || uuid();

	// TODO https://github.com/sveltejs/kit/issues/1046
	if (request.query.has('_method')) {
		request.method = request.query.get('_method').toUpperCase();
	}

	const response = await resolve(request);

	if (!cookies.userid) {
		// if this is the first time the user has visited this app,
		// set a cookie so that we recognize them when they return
		response.headers['set-cookie'] = `userid=${request.locals.userid}; Path=/; HttpOnly`;
	}

	return response;
};
