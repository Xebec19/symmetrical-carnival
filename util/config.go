package util

import (
	"github.com/spf13/viper"
)

type Config struct {
	DUMMY string `mapstructure:"DUMMY"`
}

// LoadConfig parses env variables stored in .env file and returns them
//
// Parameters:
//   - path: a string representing .env file relative location
//
// Returns:
//   - config: a interface{} which gives variables stored in .env
//   - err: a error in case parsing environment variables failed
func LoadConfig(path string) (config Config, err error) {
	viper.AddConfigPath(path)
	viper.SetConfigName("app")
	viper.SetConfigType("env")

	viper.AutomaticEnv()

	err = viper.ReadInConfig()
	if err != nil {
		return
	}

	err = viper.Unmarshal(&config)
	return
}
