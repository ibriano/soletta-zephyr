#include <soletta.h>
#include <sol-gpio.h>

static struct sol_gpio *led;
static struct sol_timeout *timer;

static bool
timer_cb(void *data)
{
    static bool toggle;

    toggle = !toggle;
    sol_gpio_write(led, toggle);
    return true;
}

static void
startup(void)
{
    struct sol_gpio_config led_conf = {
        SOL_SET_API_VERSION(.api_version = SOL_GPIO_CONFIG_API_VERSION, )
        .dir = SOL_GPIO_DIR_OUT
    };

    led = sol_gpio_open(25, &led_conf);
    SOL_NULL_CHECK(led);

    timer = sol_timeout_add(1000, timer_cb, NULL);
}
SOL_MAIN_DEFAULT(startup, NULL)
