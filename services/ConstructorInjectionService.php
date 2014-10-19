<?php

/**
 * Isotope eCommerce Migration Tool
 *
 * Copyright (C) 2014 terminal42 gmbh
 *
 * @link       http://isotopeecommerce.org
 * @license    http://opensource.org/licenses/lgpl-3.0.html
 */

namespace Isotope\Migration\Service;

/**
 * Class ConstructorInjectionService
 *
 * Provides auto dependency injection for constructor parameters based on Pimple
 * Heavily inspired by https://github.com/ukautz/wart/
 */
class ConstructorInjectionService
{
    /**
     * Dependency container
     * @type \Pimple
     */
    protected $container;


    public function __construct(\Pimple $container)
    {
        $this->container = $container;
    }

    /**
     * Create an instance of given class
     *
     * @param string $className
     * @param array  $arguments
     *
     * @return object
     */
    public function create($className, array $arguments = array())
    {
        $classReflection = new \ReflectionClass($className);

        if (!$classReflection->hasMethod('__construct')) {
            return $classReflection->newInstance();

        } else {
            $constructorReflection   = $classReflection->getMethod('__construct');
            $constructorArgs         = $this->generateConstructorParameters($constructorReflection, $arguments);

            return $classReflection->newInstanceArgs($constructorArgs);
        }
    }

    /**
     * Returns a closure to lazy-instantiate the class
     *
     * @param string $className
     * @param array  $arguments
     *
     * @return callable
     */
    public function register($className, array $arguments = array())
    {
        $self = $this;

        return function() use ($className, $arguments, $self) {
            return $self->create($className, $arguments);
        };
    }

    /**
     * Returns a closure that stores the class for uniqueness
     *
     * @param string $className
     * @param array  $arguments
     *
     * @return callable
     */
    public function share($className, array $arguments = array())
    {
        return $this->container->share($this->register($className, $arguments));
    }

    /**
     * Generate constructor parameters from DI container
     *
     * @param \ReflectionMethod $methodReflection
     * @param array             $arguments
     *
     * @return array
     */
    protected function generateConstructorParameters(\ReflectionMethod $methodReflection, array $arguments)
    {
        $buildArgs = array();

        foreach ($methodReflection->getParameters() as $parameterReflection) {
            $name = $parameterReflection->getName();

            if (isset($arguments[$name])) {
                $buildArgs[$name] = $arguments[$name];
            } elseif (isset($this->container[$name])) {
                $buildArgs[$name] = $this->container[$name];
            } elseif (isset($this->container[str_replace('_', '.', $name)])) {
                $buildArgs[$name] = $this->container[str_replace('_', '.', $name)];
            } elseif ($name == 'app' || $name == 'container') {
                $buildArgs[$name] = $this->container;
            } elseif ($parameterReflection->isOptional()) {
                $buildArgs[$name] = $parameterReflection->getDefaultValue();
            } else {
                throw new \RuntimeException(sprintf('Cannot resolve parameter "%s" for class "%s"', $name, $methodReflection->getDeclaringClass()->getName()));
            }
        }

        return $buildArgs;
    }
}
