function update_cntlm
    echo -n 'Password:'
    set ntlmv2 (cntlm -H -d MAIN -u d043635 | grep PassNTLMv2)
    echo

    # /etc への書き込み権限がないと sed -i での上書きはできない
    # /etc/cntlm.conf の書き込み権限がある前提で無理やり上書き
    sed -e "s/^PassNTLMv2.*/$ntlmv2/" /etc/cntlm.conf > ./tmp_cntlm.conf
    cat tmp_cntlm.conf > /etc/cntlm.conf
    rm tmp_cntlm.conf
end

