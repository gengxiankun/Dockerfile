#!/bin/bash
# auther: ge2x3k2@gmail.com

ganacgeCliExec="ganache-cli"

if [[ ! -z "${GHOSTNAME}" ]];then
	ganacgeCliExec="${ganacgeCliExec} -h ${GHOSTNAME}"
fi

if [[ ! -z "${ACCOUNTS}" ]];then
	ganacgeCliExec="${ganacgeCliExec} -a ${ACCOUNTS}"
fi

if [[ ! -z "${BLOCKTIME}" ]];then
	ganacgeCliExec="${ganacgeCliExec} -b ${BLOCKTIME}"
fi

if [[ ! -z "${DETERMINISTIC}" ]];then
	ganacgeCliExec="${ganacgeCliExec} -d ${DETERMINISTIC}"
fi

if [[ ! -z "${SEED}" ]];then
	ganacgeCliExec="${ganacgeCliExec} -s ${SEED}"
fi

if [[ ! -z "${gasPrice}" ]];then
	ganacgeCliExec="${ganacgeCliExec} -g ${gasPrice}"
fi

if [[ ! -z "${gasLimit}" ]];then
	ganacgeCliExec="${ganacgeCliExec} -l ${gasLimit}"
fi

if [[ ! -z "${FORK}" ]];then
	ganacgeCliExec="${ganacgeCliExec} -f ${FORK}"
fi

if [[ ! -z "${NETWORKID}" ]];then
	ganacgeCliExec="${ganacgeCliExec} -i ${NETWORKID}"
fi

if [[ ! -z "${PORT}" ]];then
	ganacgeCliExec="${ganacgeCliExec} -p ${PORT}"
fi

if [[ ! -z "${DB}" ]];then
	ganacgeCliExec="${ganacgeCliExec} --db ${DB}"
fi

if [[ ! -z "${DEBUG}" ]];then
	ganacgeCliExec="${ganacgeCliExec} --debug ${DEBUG}"
fi

if [[ ! -z "${MEM}" ]];then
	ganacgeCliExec="${ganacgeCliExec} --mem ${MEM}"
fi

echo "info: EXEC ${ganacgeCliExec}"
${ganacgeCliExec}
