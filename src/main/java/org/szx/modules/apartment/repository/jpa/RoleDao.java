/*******************************************************************************
 * Copyright (c) 2005, 2014 springside.github.io
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 *******************************************************************************/
package org.szx.modules.apartment.repository.jpa;

import org.springframework.data.repository.PagingAndSortingRepository;
import org.szx.modules.apartment.entity.Role;

public interface RoleDao extends PagingAndSortingRepository<Role, Long> {

}
