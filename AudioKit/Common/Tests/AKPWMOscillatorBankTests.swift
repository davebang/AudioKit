//
//  AKPWMOscillatorBankTests.swift
//  AudioKitTestSuiteTests
//
//  Created by Aurelius Prochazka on 7/21/17.
//  Copyright © 2017 AudioKit. All rights reserved.
//

import AudioKit
import XCTest

class AKPWMOscillatorBankTests: AKTestCase {

    var inputBank: AKPWMOscillatorBank!

    override func setUp() {
        super.setUp()
        // Need to have a longer test duration to allow for envelope to progress
        duration = 1.0

        afterStart = {
            self.inputBank.play(noteNumber: 60, velocity: 120)
            self.inputBank.play(noteNumber: 64, velocity: 110)
            self.inputBank.play(noteNumber: 67, velocity: 100)
        }
    }

    func testDefault() {
        inputBank = AKPWMOscillatorBank()
        output = inputBank
        AKTestMD5("21260d9b69a81fbe3e576c3acb030ac5")
    }

    func testParameters() {
        inputBank = AKPWMOscillatorBank(pulseWidth: 0.345,
                                        attackDuration: 0.123,
                                        decayDuration: 0.234,
                                        sustainLevel: 0.345,
                                        detuningOffset: 1,
                                        detuningMultiplier: 1.1)
        output = inputBank
        AKTestMD5("5fec778309401fe4372e6389f78bfeaa")
    }

    func testPulseWidth() {
        inputBank = AKPWMOscillatorBank(pulseWidth: 0.345)
        output = inputBank
        AKTestMD5("e52de37f6d87925dbe7c81da20f803dd")
    }

    func testAttackDuration() {
        inputBank = AKPWMOscillatorBank(attackDuration: 0.123)
        output = inputBank
        AKTestMD5("34e35d1fef64c34bd373c6a5eaefca45")
    }

    func testDecayDuration() {
        inputBank = AKPWMOscillatorBank(decayDuration: 0.234)
        output = inputBank
        AKTestMD5("0696d4dc957dd181e0a732936e5dd43a")
    }

    func testSustainLevel() {
        inputBank = AKPWMOscillatorBank(sustainLevel: 0.345)
        output = inputBank
        AKTestMD5("168188cda8165ab6fae58450c7c013de")
    }

    func testDetuningOffset() {
        inputBank = AKPWMOscillatorBank(detuningOffset: 1)
        output = inputBank
        AKTestMD5("7baf57bb280cc39545457f2823841381")
    }

    func testDetuningMultiplier() {
        inputBank = AKPWMOscillatorBank(detuningMultiplier: 1.1)
        output = inputBank
        AKTestMD5("3c6b4eed56b165ebf40a2d86dc6cb985")
    }
}