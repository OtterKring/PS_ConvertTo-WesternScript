<#
.SYNOPSIS
Converts all localized characters in a string (äöüß and other eastern europe chars) to a simple ascii aquivalent

.PARAMETER InputObject
holds the string to be converted to western script

Pipeline support : yes

.EXAMPLE
'Löffel' | ConvertTo-WesternScript

-> 'Loeffel'

.NOTES
by Maximilian Otter, 20190828
#>
function ConvertTo-WesternScript {
    param (
        [Parameter(Mandatory,ValueFromPipeline,Position=0)]
        [string]$InputObject
    )

    begin {

        # Create OrderedDictionary for character substitution
        $Hash = [ordered]@{
            192 = 'A'
            193 = 'A'
            194 = 'A'
            195 = 'A'
            196 = 'A'
            197 = 'A'
            198 = 'AE'
            199 = 'C'
            200 = 'E'
            201 = 'E'
            202 = 'E'
            203 = 'E'
            204 = 'I'
            205 = 'I'
            206 = 'I'
            207 = 'I'
            208 = 'D'
            209 = 'N'
            210 = 'O'
            211 = 'O'
            212 = 'O'
            213 = 'O'
            214 = 'OE'
            215 = 'x'
            216 = 'O'
            217 = 'U'
            218 = 'U'
            219 = 'U'
            220 = 'UE'
            221 = 'Y'
            223 = 'ss'
            224 = 'a'
            225 = 'a'
            226 = 'a'
            227 = 'a'
            228 = 'ae'
            229 = 'a'
            230 = 'ae'
            231 = 'c'
            232 = 'e'
            233 = 'e'
            234 = 'e'
            235 = 'e'
            236 = 'i'
            237 = 'i'
            238 = 'i'
            239 = 'i'
            241 = 'n'
            242 = 'o'
            243 = 'o'
            244 = 'o'
            245 = 'o'
            246 = 'oe'
            248 = 'o'
            249 = 'u'
            250 = 'u'
            251 = 'u'
            252 = 'ue'
            253 = 'y'
            255 = 'y'
            256 = 'A'
            257 = 'a'
            258 = 'A'
            259 = 'a'
            260 = 'A'
            261 = 'a'
            262 = 'C'
            263 = 'c'
            264 = 'C'
            265 = 'c'
            266 = 'C'
            267 = 'c'
            268 = 'C'
            269 = 'c'
            270 = 'D'
            271 = 'd'
            272 = 'D'
            273 = 'd'
            274 = 'E'
            275 = 'e'
            276 = 'E'
            277 = 'e'
            278 = 'E'
            279 = 'e'
            280 = 'E'
            281 = 'e'
            282 = 'E'
            283 = 'e'
            284 = 'G'
            285 = 'g'
            286 = 'G'
            287 = 'g'
            288 = 'G'
            289 = 'g'
            290 = 'G'
            291 = 'g'
            292 = 'H'
            293 = 'h'
            295 = 'h'
            296 = 'I'
            297 = 'i'
            298 = 'I'
            299 = 'i'
            300 = 'I'
            301 = 'i'
            302 = 'I'
            303 = 'i'
            304 = 'I'
            305 = 'i'
            306 = 'IJ'
            307 = 'ij'
            308 = 'J'
            309 = 'j'
            310 = 'K'
            311 = 'k'
            312 = 'k'
            313 = 'L'
            314 = 'l'
            315 = 'L'
            316 = 'l'
            317 = 'L'
            318 = 'l'
            319 = 'L'
            320 = 'l'
            321 = 'L'
            322 = 'l'
            323 = 'N'
            324 = 'n'
            325 = 'N'
            326 = 'n'
            327 = 'N'
            328 = 'n'
            329 = 'n'
            330 = 'N'
            331 = 'n'
            332 = 'O'
            333 = 'o'
            334 = 'O'
            335 = 'o'
            336 = 'OE'
            337 = 'oe'
            338 = 'OE'
            339 = 'oe'
            340 = 'R'
            341 = 'r'
            342 = 'R'
            343 = 'r'
            344 = 'R'
            345 = 'r'
            346 = 'S'
            347 = 's'
            348 = 'S'
            349 = 's'
            350 = 'S'
            351 = 's'
            352 = 'S'
            353 = 's'
            354 = 'T'
            355 = 't'
            356 = 'T'
            357 = 't'
            360 = 'U'
            361 = 'u'
            362 = 'U'
            363 = 'u'
            364 = 'U'
            365 = 'u'
            366 = 'U'
            367 = 'u'
            368 = 'UE'
            369 = 'ue'
            370 = 'U'
            371 = 'u'
            372 = 'W'
            373 = 'w'
            374 = 'Y'
            375 = 'y'
            376 = 'Y'
            377 = 'Z'
            378 = 'z'
            379 = 'Z'
            380 = 'z'
            381 = 'Z'
            382 = 'z'
            384 = 'b'
            385 = 'B'
            391 = 'C'
            392 = 'c'
            393 = ''
            394 = 'D'
            401 = 'F'
            402 = 'f'
            403 = 'G'
            408 = 'K'
            409 = 'k'
            410 = 'l'
            427 = 't'
            428 = 'T'
            429 = 't'
            430 = 'T'
            431 = 'U'
            432 = 'u'
            434 = 'U'
            435 = 'Y'
            436 = 'y'
            437 = 'Z'
            438 = 'z'
            447 = 'p'
            452 = 'DZ'
            453 = 'Dz'
            454 = 'dz'
            455 = 'LJ'
            456 = 'Lj'
            457 = 'lj'
            458 = 'NJ'
            459 = 'Nj'
            460 = 'nj'
            461 = 'A'
            462 = 'a'
            463 = 'I'
            464 = 'i'
            465 = 'O'
            466 = 'o'
            467 = 'U'
            468 = 'u'
            469 = 'U'
            470 = 'u'
            471 = 'U'
            472 = 'u'
            473 = 'U'
            474 = 'u'
            475 = 'U'
            476 = 'u'
            477 = 'e'
            478 = 'A'
            479 = 'a'
            480 = 'A'
            481 = 'a'
            482 = 'AE'
            483 = 'ae'
            484 = 'G'
            485 = 'g'
            486 = 'G'
            487 = 'g'
            488 = 'K'
            489 = 'k'
            490 = 'O'
            491 = 'o'
            492 = 'O'
            493 = 'o'
            496 = 'J'
            497 = 'DZ'
            498 = 'Dz'
            499 = 'dz'
            500 = 'G'
            501 = 'g'
            502 = 'H'
            504 = 'N'
            505 = 'n'
            506 = 'A'
            507 = 'a'
            508 = 'AE'
            509 = 'ae'
            510 = 'O'
            511 = 'o'
            512 = 'AE'
            513 = 'ae'
            514 = 'A'
            515 = 'a'
            516 = 'E'
            517 = 'e'
            518 = 'E'
            519 = 'e'
            520 = 'I'
            521 = 'i'
            522 = 'I'
            523 = 'i'
            524 = 'OE'
            525 = 'oe'
            526 = 'O'
            527 = 'o'
            528 = 'R'
            529 = 'r'
            530 = 'R'
            531 = 'r'
            532 = 'U'
            533 = 'u'
            534 = 'U'
            535 = 'u'
            536 = 'S'
            537 = 's'
            538 = 'T'
            539 = 't'
            542 = 'H'
            543 = 'h'
            548 = 'Z'
            549 = 'z'
            550 = 'A'
            551 = 'a'
            552 = 'E'
            553 = 'e'
            554 = 'O'
            555 = 'o'
            556 = 'O'
            557 = 'o'
            558 = 'O'
            559 = 'o'
            560 = 'O'
            561 = 'o'
            562 = 'Y'
            563 = 'y'
            564 = 'l'
            565 = 'n'
            566 = 't'
            567 = 'j'
            570 = 'A'
            571 = 'C'
            572 = 'c'
            573 = 'L'
            574 = 'T'
            575 = 's'
            576 = 'z'
            582 = 'E'
            583 = 'e'
            584 = 'J'
            585 = 'j'
            588 = 'R'
            589 = 'r'
            590 = 'Y'
            591 = 'y'
            611 = 'Y'
            612 = 'y'
            614 = 'h'
            615 = 'h'
            616 = 'i'
            617 = 'i'
            618 = 'i'
            619 = 'l'
            620 = 'l'
        }
        [int32]$HashBottomKey = ([int32[]]$Hash.Keys)[0]
        [int32]$HashTopKey = ([int32[]]$Hash.Keys)[-1]

        # prepare generic list for character codes to be replaced
        $CodeList = [System.Collections.Generic.List[int32]]::new()
        
    }

    process {

        # find characters to be replaced in given string and save one instance of each in the generic list
        # code lower or higher than included in the translation table are omitted, too
        foreach ($code in [int32[]][char[]]$InputObject) {
            if (-not($CodeList.Contains($code) -or $code -lt $HashBottomKey -or $code -gt $HashTopKey)) {
                $CodeList.Add($code)
            }
        }

        # iterate over the generated list of codes to replace and case-senitively replace them in string
        foreach ($code in $CodeList) {
            $InputObject = $InputObject -creplace [char]$code,$Hash.$code
        }
        # clear the list of codes to prepare for the next object in the pipeline
        $CodeList.Clear()

        $InputObject

    }

    end {
        # nothing yet
    }

}