/// @param {Id.Socket} _socket
/// @param {Id.Buffer} _buff
function network_send_to_clients_except(_socket, _buff) {
	with(obj_server_player) {
		if (socket != _socket) {
			// don't send data to player which is processed now, only to others
			network_send_packet(socket, _buff, buffer_tell(_buff));
		}
	}
}