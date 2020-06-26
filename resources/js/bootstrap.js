window._ = require('lodash');

/**
 * We'll load the axios HTTP library which allows us to easily issue requests
 * to our Laravel back-end. This library automatically handles sending the
 * CSRF token as a header based on the value of the "XSRF" token cookie.
 * 
 * Carregaremos a biblioteca HTTP axios, que nos permite emitir solicitações facilmente
 * ao nosso back-end do Laravel. Esta biblioteca lida automaticamente com o envio do
 * Token CSRF como um cabeçalho com base no valor do cookie de token "XSRF".
 */

window.axios = require('axios');

window.axios.defaults.headers.common['X-Requested-With'] = 'XMLHttpRequest';

/**
 * Echo exposes an expressive API for subscribing to channels and listening
 * for events that are broadcast by Laravel. Echo and event broadcasting
 * allows your team to easily build robust real-time web applications.
 * 
 * O Echo expõe uma API expressiva para assinar canais e ouvir
 * para eventos transmitidos pelo Laravel. Transmissão de eco e eventos
 * permite que sua equipe crie facilmente aplicativos Web robustos em tempo real.
 */

// import Echo from 'laravel-echo';

// window.Pusher = require('pusher-js');

// window.Echo = new Echo({
//     broadcaster: 'pusher',
//     key: process.env.MIX_PUSHER_APP_KEY,
//     cluster: process.env.MIX_PUSHER_APP_CLUSTER,
//     forceTLS: true
// });
