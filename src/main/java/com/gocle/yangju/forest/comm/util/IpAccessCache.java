package com.gocle.yangju.forest.comm.util;

import java.util.Collections;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.gocle.yangju.forest.adm.ip.service.AdminIpService;

@Component
public class IpAccessCache {

    private final AdminIpService adminIpService;
    private Set<String> allowedIps = new HashSet<>();

    @Autowired
    public IpAccessCache(AdminIpService adminIpService) {
        this.adminIpService = adminIpService;
        refresh();
    }

    /**
     * IP 캐시 갱신
     */
    public synchronized void refresh() {
        List<String> resultList = Collections.emptyList();
        try {
            resultList = adminIpService.selectAccessAllIpList();
        } catch (Exception e) {
            e.printStackTrace();
        }
        allowedIps = new HashSet<>(resultList);
        System.out.println("IP cache refresh: " + allowedIps);
    }

    /**
     * 접근 허용 여부 체크
     */
    public boolean isAllowed(String ip) {
        if (ip == null || ip.isEmpty()) return false;
        return allowedIps.contains(ip);
    }

    /**
     * 현재 캐시 확인용
     */
    public Set<String> getAllowedIps() {
        return Collections.unmodifiableSet(allowedIps);
    }
}