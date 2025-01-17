// Copyright (c) 2009-2010 Satoshi Nakamoto
// Copyright (c) 2009-2018 The Bitcoin Core developers
// Copyright (c) 2021 The Bitcoin3 Core developers
// Distributed under the MIT software license, see the accompanying
// file COPYING or http://www.opensource.org/licenses/mit-license.php.

#ifndef BITCOIN3_SHUTDOWN_H
#define BITCOIN3_SHUTDOWN_H

void StartShutdown();
void AbortShutdown();
bool ShutdownRequested();

#endif
