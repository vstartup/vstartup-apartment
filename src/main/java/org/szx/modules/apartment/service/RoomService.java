package org.szx.modules.apartment.service;

import java.util.List;

import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;
import org.szx.modules.apartment.entity.Room;

@Component
@Transactional
public class RoomService {
	public List<Room> findRoomByParam(){
		return null;
	}
}
