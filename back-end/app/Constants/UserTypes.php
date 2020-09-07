<?php

namespace App\Constants;
/**
 * UserTypes -To use the UserTypes constants throughout the project, later we will add here more if needed
 */
class UserTypes
{
    const GUEST = 0;
    const REGISTERED = 1;
    
    const ALL_TYPES = [
        self::GUEST,
        self::REGISTERED
    ];
}
